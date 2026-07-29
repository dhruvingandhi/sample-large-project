# Explore: explore_0596
# Auto-generated LookML Explore File

include: "/views/domain_39/view_01789.view.lkml"
include: "/views/domain_41/view_01791.view.lkml"
include: "/views/domain_42/view_01792.view.lkml"
include: "/views/domain_43/view_01793.view.lkml"

explore: explore_0596 {
  label: "Explore Explore 0596"
  description: "Comprehensive analytics explore joining base view_01789 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01789
  
  always_filter: {
    filters: [view_01789.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01789.created_at_date: "7 days"]
    unless: [view_01789.id, view_01789.status]
  }

  join: view_01791 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01789.user_id} = ${view_01791.id} ;;
    required_joins: []
  }

  join: view_01792 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01789.account_id} = ${view_01792.account_id} ;;
    required_joins: [view_01791]
  }

  join: view_01793 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01789.category} = ${view_01793.category} ;;
  }

  access_filter: {
    field: view_01789.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01789.is_deleted} = false ;;
}
