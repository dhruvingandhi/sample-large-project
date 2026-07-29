# Explore: explore_2365
# Auto-generated LookML Explore File

include: "/views/domain_46/view_07096.view.lkml"
include: "/views/domain_48/view_07098.view.lkml"
include: "/views/domain_49/view_07099.view.lkml"
include: "/views/domain_50/view_07100.view.lkml"

explore: explore_2365 {
  label: "Explore Explore 2365"
  description: "Comprehensive analytics explore joining base view_07096 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07096
  
  always_filter: {
    filters: [view_07096.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07096.created_at_date: "7 days"]
    unless: [view_07096.id, view_07096.status]
  }

  join: view_07098 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07096.user_id} = ${view_07098.id} ;;
    required_joins: []
  }

  join: view_07099 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07096.account_id} = ${view_07099.account_id} ;;
    required_joins: [view_07098]
  }

  join: view_07100 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07096.category} = ${view_07100.category} ;;
  }

  access_filter: {
    field: view_07096.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07096.is_deleted} = false ;;
}
