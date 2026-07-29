# Explore: explore_1331
# Auto-generated LookML Explore File

include: "/views/domain_44/view_03994.view.lkml"
include: "/views/domain_46/view_03996.view.lkml"
include: "/views/domain_47/view_03997.view.lkml"
include: "/views/domain_48/view_03998.view.lkml"

explore: explore_1331 {
  label: "Explore Explore 1331"
  description: "Comprehensive analytics explore joining base view_03994 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03994
  
  always_filter: {
    filters: [view_03994.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03994.created_at_date: "7 days"]
    unless: [view_03994.id, view_03994.status]
  }

  join: view_03996 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03994.user_id} = ${view_03996.id} ;;
    required_joins: []
  }

  join: view_03997 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03994.account_id} = ${view_03997.account_id} ;;
    required_joins: [view_03996]
  }

  join: view_03998 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03994.category} = ${view_03998.category} ;;
  }

  access_filter: {
    field: view_03994.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03994.is_deleted} = false ;;
}
