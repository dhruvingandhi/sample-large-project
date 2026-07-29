# Explore: explore_1532
# Auto-generated LookML Explore File

include: "/views/domain_47/view_04597.view.lkml"
include: "/views/domain_49/view_04599.view.lkml"
include: "/views/domain_50/view_04600.view.lkml"
include: "/views/domain_01/view_04601.view.lkml"

explore: explore_1532 {
  label: "Explore Explore 1532"
  description: "Comprehensive analytics explore joining base view_04597 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04597
  
  always_filter: {
    filters: [view_04597.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04597.created_at_date: "7 days"]
    unless: [view_04597.id, view_04597.status]
  }

  join: view_04599 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04597.user_id} = ${view_04599.id} ;;
    required_joins: []
  }

  join: view_04600 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04597.account_id} = ${view_04600.account_id} ;;
    required_joins: [view_04599]
  }

  join: view_04601 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04597.category} = ${view_04601.category} ;;
  }

  access_filter: {
    field: view_04597.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04597.is_deleted} = false ;;
}
