# Explore: explore_2670
# Auto-generated LookML Explore File

include: "/views/domain_11/view_08011.view.lkml"
include: "/views/domain_13/view_08013.view.lkml"
include: "/views/domain_14/view_08014.view.lkml"
include: "/views/domain_15/view_08015.view.lkml"

explore: explore_2670 {
  label: "Explore Explore 2670"
  description: "Comprehensive analytics explore joining base view_08011 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08011
  
  always_filter: {
    filters: [view_08011.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08011.created_at_date: "7 days"]
    unless: [view_08011.id, view_08011.status]
  }

  join: view_08013 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08011.user_id} = ${view_08013.id} ;;
    required_joins: []
  }

  join: view_08014 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08011.account_id} = ${view_08014.account_id} ;;
    required_joins: [view_08013]
  }

  join: view_08015 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08011.category} = ${view_08015.category} ;;
  }

  access_filter: {
    field: view_08011.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08011.is_deleted} = false ;;
}
