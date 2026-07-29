# Explore: explore_2307
# Auto-generated LookML Explore File

include: "/views/domain_22/view_06922.view.lkml"
include: "/views/domain_24/view_06924.view.lkml"
include: "/views/domain_25/view_06925.view.lkml"
include: "/views/domain_26/view_06926.view.lkml"

explore: explore_2307 {
  label: "Explore Explore 2307"
  description: "Comprehensive analytics explore joining base view_06922 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06922
  
  always_filter: {
    filters: [view_06922.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06922.created_at_date: "7 days"]
    unless: [view_06922.id, view_06922.status]
  }

  join: view_06924 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06922.user_id} = ${view_06924.id} ;;
    required_joins: []
  }

  join: view_06925 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06922.account_id} = ${view_06925.account_id} ;;
    required_joins: [view_06924]
  }

  join: view_06926 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06922.category} = ${view_06926.category} ;;
  }

  access_filter: {
    field: view_06922.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06922.is_deleted} = false ;;
}
