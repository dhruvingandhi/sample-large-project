# Explore: explore_1229
# Auto-generated LookML Explore File

include: "/views/domain_38/view_03688.view.lkml"
include: "/views/domain_40/view_03690.view.lkml"
include: "/views/domain_41/view_03691.view.lkml"
include: "/views/domain_42/view_03692.view.lkml"

explore: explore_1229 {
  label: "Explore Explore 1229"
  description: "Comprehensive analytics explore joining base view_03688 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03688
  
  always_filter: {
    filters: [view_03688.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03688.created_at_date: "7 days"]
    unless: [view_03688.id, view_03688.status]
  }

  join: view_03690 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03688.user_id} = ${view_03690.id} ;;
    required_joins: []
  }

  join: view_03691 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03688.account_id} = ${view_03691.account_id} ;;
    required_joins: [view_03690]
  }

  join: view_03692 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03688.category} = ${view_03692.category} ;;
  }

  access_filter: {
    field: view_03688.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03688.is_deleted} = false ;;
}
