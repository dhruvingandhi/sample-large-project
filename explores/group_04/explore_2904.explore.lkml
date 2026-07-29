# Explore: explore_2904
# Auto-generated LookML Explore File

include: "/views/domain_13/view_08713.view.lkml"
include: "/views/domain_15/view_08715.view.lkml"
include: "/views/domain_16/view_08716.view.lkml"
include: "/views/domain_17/view_08717.view.lkml"

explore: explore_2904 {
  label: "Explore Explore 2904"
  description: "Comprehensive analytics explore joining base view_08713 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08713
  
  always_filter: {
    filters: [view_08713.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08713.created_at_date: "7 days"]
    unless: [view_08713.id, view_08713.status]
  }

  join: view_08715 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08713.user_id} = ${view_08715.id} ;;
    required_joins: []
  }

  join: view_08716 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08713.account_id} = ${view_08716.account_id} ;;
    required_joins: [view_08715]
  }

  join: view_08717 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08713.category} = ${view_08717.category} ;;
  }

  access_filter: {
    field: view_08713.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08713.is_deleted} = false ;;
}
