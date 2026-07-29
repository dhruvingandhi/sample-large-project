# Explore: explore_0621
# Auto-generated LookML Explore File

include: "/views/domain_14/view_01864.view.lkml"
include: "/views/domain_16/view_01866.view.lkml"
include: "/views/domain_17/view_01867.view.lkml"
include: "/views/domain_18/view_01868.view.lkml"

explore: explore_0621 {
  label: "Explore Explore 0621"
  description: "Comprehensive analytics explore joining base view_01864 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01864
  
  always_filter: {
    filters: [view_01864.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01864.created_at_date: "7 days"]
    unless: [view_01864.id, view_01864.status]
  }

  join: view_01866 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01864.user_id} = ${view_01866.id} ;;
    required_joins: []
  }

  join: view_01867 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01864.account_id} = ${view_01867.account_id} ;;
    required_joins: [view_01866]
  }

  join: view_01868 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01864.category} = ${view_01868.category} ;;
  }

  access_filter: {
    field: view_01864.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01864.is_deleted} = false ;;
}
