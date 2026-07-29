# Explore: explore_2288
# Auto-generated LookML Explore File

include: "/views/domain_15/view_06865.view.lkml"
include: "/views/domain_17/view_06867.view.lkml"
include: "/views/domain_18/view_06868.view.lkml"
include: "/views/domain_19/view_06869.view.lkml"

explore: explore_2288 {
  label: "Explore Explore 2288"
  description: "Comprehensive analytics explore joining base view_06865 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06865
  
  always_filter: {
    filters: [view_06865.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06865.created_at_date: "7 days"]
    unless: [view_06865.id, view_06865.status]
  }

  join: view_06867 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06865.user_id} = ${view_06867.id} ;;
    required_joins: []
  }

  join: view_06868 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06865.account_id} = ${view_06868.account_id} ;;
    required_joins: [view_06867]
  }

  join: view_06869 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06865.category} = ${view_06869.category} ;;
  }

  access_filter: {
    field: view_06865.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06865.is_deleted} = false ;;
}
