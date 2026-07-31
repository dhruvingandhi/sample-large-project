# Update for 2000 file diff target
# Explore: explore_1320
# Auto-generated LookML Explore File

include: "/views/domain_11/view_03961.view.lkml"
include: "/views/domain_13/view_03963.view.lkml"
include: "/views/domain_14/view_03964.view.lkml"
include: "/views/domain_15/view_03965.view.lkml"

explore: explore_1320 {
  label: "Explore Explore 1320"
  description: "Comprehensive analytics explore joining base view_03961 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03961
  
  always_filter: {
    filters: [view_03961.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03961.created_at_date: "7 days"]
    unless: [view_03961.id, view_03961.status]
  }

  join: view_03963 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03961.user_id} = ${view_03963.id} ;;
    required_joins: []
  }

  join: view_03964 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03961.account_id} = ${view_03964.account_id} ;;
    required_joins: [view_03963]
  }

  join: view_03965 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03961.category} = ${view_03965.category} ;;
  }

  access_filter: {
    field: view_03961.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03961.is_deleted} = false ;;
}
