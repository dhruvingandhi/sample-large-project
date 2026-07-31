# Update for 2000 file diff target
# Explore: explore_1330
# Auto-generated LookML Explore File

include: "/views/domain_41/view_03991.view.lkml"
include: "/views/domain_43/view_03993.view.lkml"
include: "/views/domain_44/view_03994.view.lkml"
include: "/views/domain_45/view_03995.view.lkml"

explore: explore_1330 {
  label: "Explore Explore 1330"
  description: "Comprehensive analytics explore joining base view_03991 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03991
  
  always_filter: {
    filters: [view_03991.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03991.created_at_date: "7 days"]
    unless: [view_03991.id, view_03991.status]
  }

  join: view_03993 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03991.user_id} = ${view_03993.id} ;;
    required_joins: []
  }

  join: view_03994 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03991.account_id} = ${view_03994.account_id} ;;
    required_joins: [view_03993]
  }

  join: view_03995 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03991.category} = ${view_03995.category} ;;
  }

  access_filter: {
    field: view_03991.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03991.is_deleted} = false ;;
}
