# Explore: explore_0331
# Auto-generated LookML Explore File

include: "/views/domain_44/view_00994.view.lkml"
include: "/views/domain_46/view_00996.view.lkml"
include: "/views/domain_47/view_00997.view.lkml"
include: "/views/domain_48/view_00998.view.lkml"

explore: explore_0331 {
  label: "Explore Explore 0331"
  description: "Comprehensive analytics explore joining base view_00994 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00994
  
  always_filter: {
    filters: [view_00994.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00994.created_at_date: "7 days"]
    unless: [view_00994.id, view_00994.status]
  }

  join: view_00996 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00994.user_id} = ${view_00996.id} ;;
    required_joins: []
  }

  join: view_00997 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00994.account_id} = ${view_00997.account_id} ;;
    required_joins: [view_00996]
  }

  join: view_00998 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00994.category} = ${view_00998.category} ;;
  }

  access_filter: {
    field: view_00994.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00994.is_deleted} = false ;;
}
