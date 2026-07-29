# Explore: explore_2942
# Auto-generated LookML Explore File

include: "/views/domain_27/view_08827.view.lkml"
include: "/views/domain_29/view_08829.view.lkml"
include: "/views/domain_30/view_08830.view.lkml"
include: "/views/domain_31/view_08831.view.lkml"

explore: explore_2942 {
  label: "Explore Explore 2942"
  description: "Comprehensive analytics explore joining base view_08827 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08827
  
  always_filter: {
    filters: [view_08827.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08827.created_at_date: "7 days"]
    unless: [view_08827.id, view_08827.status]
  }

  join: view_08829 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08827.user_id} = ${view_08829.id} ;;
    required_joins: []
  }

  join: view_08830 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08827.account_id} = ${view_08830.account_id} ;;
    required_joins: [view_08829]
  }

  join: view_08831 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08827.category} = ${view_08831.category} ;;
  }

  access_filter: {
    field: view_08827.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08827.is_deleted} = false ;;
}
