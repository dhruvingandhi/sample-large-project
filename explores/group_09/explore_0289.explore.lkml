# Explore: explore_0289
# Auto-generated LookML Explore File

include: "/views/domain_18/view_00868.view.lkml"
include: "/views/domain_20/view_00870.view.lkml"
include: "/views/domain_21/view_00871.view.lkml"
include: "/views/domain_22/view_00872.view.lkml"

explore: explore_0289 {
  label: "Explore Explore 0289"
  description: "Comprehensive analytics explore joining base view_00868 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00868
  
  always_filter: {
    filters: [view_00868.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00868.created_at_date: "7 days"]
    unless: [view_00868.id, view_00868.status]
  }

  join: view_00870 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00868.user_id} = ${view_00870.id} ;;
    required_joins: []
  }

  join: view_00871 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00868.account_id} = ${view_00871.account_id} ;;
    required_joins: [view_00870]
  }

  join: view_00872 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00868.category} = ${view_00872.category} ;;
  }

  access_filter: {
    field: view_00868.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00868.is_deleted} = false ;;
}
