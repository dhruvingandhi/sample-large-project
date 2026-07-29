# Explore: explore_2337
# Auto-generated LookML Explore File

include: "/views/domain_12/view_07012.view.lkml"
include: "/views/domain_14/view_07014.view.lkml"
include: "/views/domain_15/view_07015.view.lkml"
include: "/views/domain_16/view_07016.view.lkml"

explore: explore_2337 {
  label: "Explore Explore 2337"
  description: "Comprehensive analytics explore joining base view_07012 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07012
  
  always_filter: {
    filters: [view_07012.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07012.created_at_date: "7 days"]
    unless: [view_07012.id, view_07012.status]
  }

  join: view_07014 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07012.user_id} = ${view_07014.id} ;;
    required_joins: []
  }

  join: view_07015 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07012.account_id} = ${view_07015.account_id} ;;
    required_joins: [view_07014]
  }

  join: view_07016 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07012.category} = ${view_07016.category} ;;
  }

  access_filter: {
    field: view_07012.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07012.is_deleted} = false ;;
}
