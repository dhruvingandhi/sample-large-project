# Explore: explore_2195
# Auto-generated LookML Explore File

include: "/views/domain_36/view_06586.view.lkml"
include: "/views/domain_38/view_06588.view.lkml"
include: "/views/domain_39/view_06589.view.lkml"
include: "/views/domain_40/view_06590.view.lkml"

explore: explore_2195 {
  label: "Explore Explore 2195"
  description: "Comprehensive analytics explore joining base view_06586 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06586
  
  always_filter: {
    filters: [view_06586.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06586.created_at_date: "7 days"]
    unless: [view_06586.id, view_06586.status]
  }

  join: view_06588 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06586.user_id} = ${view_06588.id} ;;
    required_joins: []
  }

  join: view_06589 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06586.account_id} = ${view_06589.account_id} ;;
    required_joins: [view_06588]
  }

  join: view_06590 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06586.category} = ${view_06590.category} ;;
  }

  access_filter: {
    field: view_06586.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06586.is_deleted} = false ;;
}
