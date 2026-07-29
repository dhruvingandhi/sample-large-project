# Explore: explore_3640
# Auto-generated LookML Explore File

include: "/views/domain_21/view_10921.view.lkml"
include: "/views/domain_23/view_10923.view.lkml"
include: "/views/domain_24/view_10924.view.lkml"
include: "/views/domain_25/view_10925.view.lkml"

explore: explore_3640 {
  label: "Explore Explore 3640"
  description: "Comprehensive analytics explore joining base view_10921 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10921
  
  always_filter: {
    filters: [view_10921.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10921.created_at_date: "7 days"]
    unless: [view_10921.id, view_10921.status]
  }

  join: view_10923 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10921.user_id} = ${view_10923.id} ;;
    required_joins: []
  }

  join: view_10924 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10921.account_id} = ${view_10924.account_id} ;;
    required_joins: [view_10923]
  }

  join: view_10925 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10921.category} = ${view_10925.category} ;;
  }

  access_filter: {
    field: view_10921.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10921.is_deleted} = false ;;
}
