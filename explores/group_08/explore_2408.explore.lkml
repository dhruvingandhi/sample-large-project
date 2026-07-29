# Explore: explore_2408
# Auto-generated LookML Explore File

include: "/views/domain_25/view_07225.view.lkml"
include: "/views/domain_27/view_07227.view.lkml"
include: "/views/domain_28/view_07228.view.lkml"
include: "/views/domain_29/view_07229.view.lkml"

explore: explore_2408 {
  label: "Explore Explore 2408"
  description: "Comprehensive analytics explore joining base view_07225 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07225
  
  always_filter: {
    filters: [view_07225.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07225.created_at_date: "7 days"]
    unless: [view_07225.id, view_07225.status]
  }

  join: view_07227 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07225.user_id} = ${view_07227.id} ;;
    required_joins: []
  }

  join: view_07228 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07225.account_id} = ${view_07228.account_id} ;;
    required_joins: [view_07227]
  }

  join: view_07229 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07225.category} = ${view_07229.category} ;;
  }

  access_filter: {
    field: view_07225.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07225.is_deleted} = false ;;
}
