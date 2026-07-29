# Explore: explore_2017
# Auto-generated LookML Explore File

include: "/views/domain_02/view_06052.view.lkml"
include: "/views/domain_04/view_06054.view.lkml"
include: "/views/domain_05/view_06055.view.lkml"
include: "/views/domain_06/view_06056.view.lkml"

explore: explore_2017 {
  label: "Explore Explore 2017"
  description: "Comprehensive analytics explore joining base view_06052 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06052
  
  always_filter: {
    filters: [view_06052.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06052.created_at_date: "7 days"]
    unless: [view_06052.id, view_06052.status]
  }

  join: view_06054 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06052.user_id} = ${view_06054.id} ;;
    required_joins: []
  }

  join: view_06055 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06052.account_id} = ${view_06055.account_id} ;;
    required_joins: [view_06054]
  }

  join: view_06056 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06052.category} = ${view_06056.category} ;;
  }

  access_filter: {
    field: view_06052.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06052.is_deleted} = false ;;
}
