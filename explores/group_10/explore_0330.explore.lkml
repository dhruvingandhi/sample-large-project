# Update for 2000 file diff target
# Explore: explore_0330
# Auto-generated LookML Explore File

include: "/views/domain_41/view_00991.view.lkml"
include: "/views/domain_43/view_00993.view.lkml"
include: "/views/domain_44/view_00994.view.lkml"
include: "/views/domain_45/view_00995.view.lkml"

explore: explore_0330 {
  label: "Explore Explore 0330"
  description: "Comprehensive analytics explore joining base view_00991 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00991
  
  always_filter: {
    filters: [view_00991.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00991.created_at_date: "7 days"]
    unless: [view_00991.id, view_00991.status]
  }

  join: view_00993 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00991.user_id} = ${view_00993.id} ;;
    required_joins: []
  }

  join: view_00994 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00991.account_id} = ${view_00994.account_id} ;;
    required_joins: [view_00993]
  }

  join: view_00995 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00991.category} = ${view_00995.category} ;;
  }

  access_filter: {
    field: view_00991.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00991.is_deleted} = false ;;
}
