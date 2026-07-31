# Update for 2000 file diff target
# Explore: explore_0478
# Auto-generated LookML Explore File

include: "/views/domain_35/view_01435.view.lkml"
include: "/views/domain_37/view_01437.view.lkml"
include: "/views/domain_38/view_01438.view.lkml"
include: "/views/domain_39/view_01439.view.lkml"

explore: explore_0478 {
  label: "Explore Explore 0478"
  description: "Comprehensive analytics explore joining base view_01435 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01435
  
  always_filter: {
    filters: [view_01435.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01435.created_at_date: "7 days"]
    unless: [view_01435.id, view_01435.status]
  }

  join: view_01437 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01435.user_id} = ${view_01437.id} ;;
    required_joins: []
  }

  join: view_01438 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01435.account_id} = ${view_01438.account_id} ;;
    required_joins: [view_01437]
  }

  join: view_01439 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01435.category} = ${view_01439.category} ;;
  }

  access_filter: {
    field: view_01435.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01435.is_deleted} = false ;;
}
