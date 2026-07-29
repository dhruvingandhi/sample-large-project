# Explore: explore_2366
# Auto-generated LookML Explore File

include: "/views/domain_49/view_07099.view.lkml"
include: "/views/domain_01/view_07101.view.lkml"
include: "/views/domain_02/view_07102.view.lkml"
include: "/views/domain_03/view_07103.view.lkml"

explore: explore_2366 {
  label: "Explore Explore 2366"
  description: "Comprehensive analytics explore joining base view_07099 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07099
  
  always_filter: {
    filters: [view_07099.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07099.created_at_date: "7 days"]
    unless: [view_07099.id, view_07099.status]
  }

  join: view_07101 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07099.user_id} = ${view_07101.id} ;;
    required_joins: []
  }

  join: view_07102 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07099.account_id} = ${view_07102.account_id} ;;
    required_joins: [view_07101]
  }

  join: view_07103 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07099.category} = ${view_07103.category} ;;
  }

  access_filter: {
    field: view_07099.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07099.is_deleted} = false ;;
}
