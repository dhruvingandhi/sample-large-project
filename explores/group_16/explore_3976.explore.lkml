# Explore: explore_3976
# Auto-generated LookML Explore File

include: "/views/domain_29/view_11929.view.lkml"
include: "/views/domain_31/view_11931.view.lkml"
include: "/views/domain_32/view_11932.view.lkml"
include: "/views/domain_33/view_11933.view.lkml"

explore: explore_3976 {
  label: "Explore Explore 3976"
  description: "Comprehensive analytics explore joining base view_11929 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11929
  
  always_filter: {
    filters: [view_11929.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11929.created_at_date: "7 days"]
    unless: [view_11929.id, view_11929.status]
  }

  join: view_11931 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11929.user_id} = ${view_11931.id} ;;
    required_joins: []
  }

  join: view_11932 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11929.account_id} = ${view_11932.account_id} ;;
    required_joins: [view_11931]
  }

  join: view_11933 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11929.category} = ${view_11933.category} ;;
  }

  access_filter: {
    field: view_11929.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11929.is_deleted} = false ;;
}
