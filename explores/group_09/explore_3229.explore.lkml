# Explore: explore_3229
# Auto-generated LookML Explore File

include: "/views/domain_38/view_09688.view.lkml"
include: "/views/domain_40/view_09690.view.lkml"
include: "/views/domain_41/view_09691.view.lkml"
include: "/views/domain_42/view_09692.view.lkml"

explore: explore_3229 {
  label: "Explore Explore 3229"
  description: "Comprehensive analytics explore joining base view_09688 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09688
  
  always_filter: {
    filters: [view_09688.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09688.created_at_date: "7 days"]
    unless: [view_09688.id, view_09688.status]
  }

  join: view_09690 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09688.user_id} = ${view_09690.id} ;;
    required_joins: []
  }

  join: view_09691 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09688.account_id} = ${view_09691.account_id} ;;
    required_joins: [view_09690]
  }

  join: view_09692 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09688.category} = ${view_09692.category} ;;
  }

  access_filter: {
    field: view_09688.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09688.is_deleted} = false ;;
}
