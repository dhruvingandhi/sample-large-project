# Explore: explore_1074
# Auto-generated LookML Explore File

include: "/views/domain_23/view_03223.view.lkml"
include: "/views/domain_25/view_03225.view.lkml"
include: "/views/domain_26/view_03226.view.lkml"
include: "/views/domain_27/view_03227.view.lkml"

explore: explore_1074 {
  label: "Explore Explore 1074"
  description: "Comprehensive analytics explore joining base view_03223 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03223
  
  always_filter: {
    filters: [view_03223.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03223.created_at_date: "7 days"]
    unless: [view_03223.id, view_03223.status]
  }

  join: view_03225 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03223.user_id} = ${view_03225.id} ;;
    required_joins: []
  }

  join: view_03226 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03223.account_id} = ${view_03226.account_id} ;;
    required_joins: [view_03225]
  }

  join: view_03227 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03223.category} = ${view_03227.category} ;;
  }

  access_filter: {
    field: view_03223.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03223.is_deleted} = false ;;
}
