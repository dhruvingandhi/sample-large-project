# Explore: explore_2067
# Auto-generated LookML Explore File

include: "/views/domain_02/view_06202.view.lkml"
include: "/views/domain_04/view_06204.view.lkml"
include: "/views/domain_05/view_06205.view.lkml"
include: "/views/domain_06/view_06206.view.lkml"

explore: explore_2067 {
  label: "Explore Explore 2067"
  description: "Comprehensive analytics explore joining base view_06202 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06202
  
  always_filter: {
    filters: [view_06202.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06202.created_at_date: "7 days"]
    unless: [view_06202.id, view_06202.status]
  }

  join: view_06204 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06202.user_id} = ${view_06204.id} ;;
    required_joins: []
  }

  join: view_06205 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06202.account_id} = ${view_06205.account_id} ;;
    required_joins: [view_06204]
  }

  join: view_06206 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06202.category} = ${view_06206.category} ;;
  }

  access_filter: {
    field: view_06202.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06202.is_deleted} = false ;;
}
