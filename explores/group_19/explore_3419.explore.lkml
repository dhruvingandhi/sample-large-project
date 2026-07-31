# Update for 2000 file diff target
# Explore: explore_3419
# Auto-generated LookML Explore File

include: "/views/domain_08/view_10258.view.lkml"
include: "/views/domain_10/view_10260.view.lkml"
include: "/views/domain_11/view_10261.view.lkml"
include: "/views/domain_12/view_10262.view.lkml"

explore: explore_3419 {
  label: "Explore Explore 3419"
  description: "Comprehensive analytics explore joining base view_10258 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10258
  
  always_filter: {
    filters: [view_10258.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10258.created_at_date: "7 days"]
    unless: [view_10258.id, view_10258.status]
  }

  join: view_10260 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10258.user_id} = ${view_10260.id} ;;
    required_joins: []
  }

  join: view_10261 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10258.account_id} = ${view_10261.account_id} ;;
    required_joins: [view_10260]
  }

  join: view_10262 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10258.category} = ${view_10262.category} ;;
  }

  access_filter: {
    field: view_10258.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10258.is_deleted} = false ;;
}
