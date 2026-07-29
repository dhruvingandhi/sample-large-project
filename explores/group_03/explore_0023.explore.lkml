# Explore: explore_0023
# Auto-generated LookML Explore File

include: "/views/domain_20/view_00070.view.lkml"
include: "/views/domain_22/view_00072.view.lkml"
include: "/views/domain_23/view_00073.view.lkml"
include: "/views/domain_24/view_00074.view.lkml"

explore: explore_0023 {
  label: "Explore Explore 0023"
  description: "Comprehensive analytics explore joining base view_00070 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00070
  
  always_filter: {
    filters: [view_00070.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00070.created_at_date: "7 days"]
    unless: [view_00070.id, view_00070.status]
  }

  join: view_00072 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00070.user_id} = ${view_00072.id} ;;
    required_joins: []
  }

  join: view_00073 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00070.account_id} = ${view_00073.account_id} ;;
    required_joins: [view_00072]
  }

  join: view_00074 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00070.category} = ${view_00074.category} ;;
  }

  access_filter: {
    field: view_00070.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00070.is_deleted} = false ;;
}
