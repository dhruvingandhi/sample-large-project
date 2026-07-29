# Explore: explore_1531
# Auto-generated LookML Explore File

include: "/views/domain_44/view_04594.view.lkml"
include: "/views/domain_46/view_04596.view.lkml"
include: "/views/domain_47/view_04597.view.lkml"
include: "/views/domain_48/view_04598.view.lkml"

explore: explore_1531 {
  label: "Explore Explore 1531"
  description: "Comprehensive analytics explore joining base view_04594 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04594
  
  always_filter: {
    filters: [view_04594.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04594.created_at_date: "7 days"]
    unless: [view_04594.id, view_04594.status]
  }

  join: view_04596 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04594.user_id} = ${view_04596.id} ;;
    required_joins: []
  }

  join: view_04597 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04594.account_id} = ${view_04597.account_id} ;;
    required_joins: [view_04596]
  }

  join: view_04598 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04594.category} = ${view_04598.category} ;;
  }

  access_filter: {
    field: view_04594.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04594.is_deleted} = false ;;
}
