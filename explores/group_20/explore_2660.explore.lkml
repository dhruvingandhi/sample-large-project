# Update for 2000 file diff target
# Explore: explore_2660
# Auto-generated LookML Explore File

include: "/views/domain_31/view_07981.view.lkml"
include: "/views/domain_33/view_07983.view.lkml"
include: "/views/domain_34/view_07984.view.lkml"
include: "/views/domain_35/view_07985.view.lkml"

explore: explore_2660 {
  label: "Explore Explore 2660"
  description: "Comprehensive analytics explore joining base view_07981 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07981
  
  always_filter: {
    filters: [view_07981.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07981.created_at_date: "7 days"]
    unless: [view_07981.id, view_07981.status]
  }

  join: view_07983 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07981.user_id} = ${view_07983.id} ;;
    required_joins: []
  }

  join: view_07984 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07981.account_id} = ${view_07984.account_id} ;;
    required_joins: [view_07983]
  }

  join: view_07985 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07981.category} = ${view_07985.category} ;;
  }

  access_filter: {
    field: view_07981.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07981.is_deleted} = false ;;
}
