# Update for 500 file diff target
# Explore: explore_1462
# Auto-generated LookML Explore File

include: "/views/domain_37/view_04387.view.lkml"
include: "/views/domain_39/view_04389.view.lkml"
include: "/views/domain_40/view_04390.view.lkml"
include: "/views/domain_41/view_04391.view.lkml"

explore: explore_1462 {
  label: "Explore Explore 1462"
  description: "Comprehensive analytics explore joining base view_04387 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04387
  
  always_filter: {
    filters: [view_04387.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04387.created_at_date: "7 days"]
    unless: [view_04387.id, view_04387.status]
  }

  join: view_04389 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04387.user_id} = ${view_04389.id} ;;
    required_joins: []
  }

  join: view_04390 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04387.account_id} = ${view_04390.account_id} ;;
    required_joins: [view_04389]
  }

  join: view_04391 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04387.category} = ${view_04391.category} ;;
  }

  access_filter: {
    field: view_04387.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04387.is_deleted} = false ;;
}
