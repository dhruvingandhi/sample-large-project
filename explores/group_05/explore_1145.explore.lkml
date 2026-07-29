# Explore: explore_1145
# Auto-generated LookML Explore File

include: "/views/domain_36/view_03436.view.lkml"
include: "/views/domain_38/view_03438.view.lkml"
include: "/views/domain_39/view_03439.view.lkml"
include: "/views/domain_40/view_03440.view.lkml"

explore: explore_1145 {
  label: "Explore Explore 1145"
  description: "Comprehensive analytics explore joining base view_03436 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03436
  
  always_filter: {
    filters: [view_03436.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03436.created_at_date: "7 days"]
    unless: [view_03436.id, view_03436.status]
  }

  join: view_03438 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03436.user_id} = ${view_03438.id} ;;
    required_joins: []
  }

  join: view_03439 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03436.account_id} = ${view_03439.account_id} ;;
    required_joins: [view_03438]
  }

  join: view_03440 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03436.category} = ${view_03440.category} ;;
  }

  access_filter: {
    field: view_03436.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03436.is_deleted} = false ;;
}
