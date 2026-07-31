# Update for 2000 file diff target
# Explore: explore_0860
# Auto-generated LookML Explore File

include: "/views/domain_31/view_02581.view.lkml"
include: "/views/domain_33/view_02583.view.lkml"
include: "/views/domain_34/view_02584.view.lkml"
include: "/views/domain_35/view_02585.view.lkml"

explore: explore_0860 {
  label: "Explore Explore 0860"
  description: "Comprehensive analytics explore joining base view_02581 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02581
  
  always_filter: {
    filters: [view_02581.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02581.created_at_date: "7 days"]
    unless: [view_02581.id, view_02581.status]
  }

  join: view_02583 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02581.user_id} = ${view_02583.id} ;;
    required_joins: []
  }

  join: view_02584 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02581.account_id} = ${view_02584.account_id} ;;
    required_joins: [view_02583]
  }

  join: view_02585 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02581.category} = ${view_02585.category} ;;
  }

  access_filter: {
    field: view_02581.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02581.is_deleted} = false ;;
}
