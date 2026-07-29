# Explore: explore_0337
# Auto-generated LookML Explore File

include: "/views/domain_12/view_01012.view.lkml"
include: "/views/domain_14/view_01014.view.lkml"
include: "/views/domain_15/view_01015.view.lkml"
include: "/views/domain_16/view_01016.view.lkml"

explore: explore_0337 {
  label: "Explore Explore 0337"
  description: "Comprehensive analytics explore joining base view_01012 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01012
  
  always_filter: {
    filters: [view_01012.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01012.created_at_date: "7 days"]
    unless: [view_01012.id, view_01012.status]
  }

  join: view_01014 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01012.user_id} = ${view_01014.id} ;;
    required_joins: []
  }

  join: view_01015 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01012.account_id} = ${view_01015.account_id} ;;
    required_joins: [view_01014]
  }

  join: view_01016 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01012.category} = ${view_01016.category} ;;
  }

  access_filter: {
    field: view_01012.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01012.is_deleted} = false ;;
}
