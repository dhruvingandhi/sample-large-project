# Explore: explore_1079
# Auto-generated LookML Explore File

include: "/views/domain_38/view_03238.view.lkml"
include: "/views/domain_40/view_03240.view.lkml"
include: "/views/domain_41/view_03241.view.lkml"
include: "/views/domain_42/view_03242.view.lkml"

explore: explore_1079 {
  label: "Explore Explore 1079"
  description: "Comprehensive analytics explore joining base view_03238 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03238
  
  always_filter: {
    filters: [view_03238.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03238.created_at_date: "7 days"]
    unless: [view_03238.id, view_03238.status]
  }

  join: view_03240 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03238.user_id} = ${view_03240.id} ;;
    required_joins: []
  }

  join: view_03241 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03238.account_id} = ${view_03241.account_id} ;;
    required_joins: [view_03240]
  }

  join: view_03242 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03238.category} = ${view_03242.category} ;;
  }

  access_filter: {
    field: view_03238.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03238.is_deleted} = false ;;
}
