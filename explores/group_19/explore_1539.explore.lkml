# Update for 2000 file diff target
# Explore: explore_1539
# Auto-generated LookML Explore File

include: "/views/domain_18/view_04618.view.lkml"
include: "/views/domain_20/view_04620.view.lkml"
include: "/views/domain_21/view_04621.view.lkml"
include: "/views/domain_22/view_04622.view.lkml"

explore: explore_1539 {
  label: "Explore Explore 1539"
  description: "Comprehensive analytics explore joining base view_04618 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04618
  
  always_filter: {
    filters: [view_04618.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04618.created_at_date: "7 days"]
    unless: [view_04618.id, view_04618.status]
  }

  join: view_04620 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04618.user_id} = ${view_04620.id} ;;
    required_joins: []
  }

  join: view_04621 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04618.account_id} = ${view_04621.account_id} ;;
    required_joins: [view_04620]
  }

  join: view_04622 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04618.category} = ${view_04622.category} ;;
  }

  access_filter: {
    field: view_04618.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04618.is_deleted} = false ;;
}
