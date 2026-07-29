# Explore: explore_1612
# Auto-generated LookML Explore File

include: "/views/domain_37/view_04837.view.lkml"
include: "/views/domain_39/view_04839.view.lkml"
include: "/views/domain_40/view_04840.view.lkml"
include: "/views/domain_41/view_04841.view.lkml"

explore: explore_1612 {
  label: "Explore Explore 1612"
  description: "Comprehensive analytics explore joining base view_04837 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04837
  
  always_filter: {
    filters: [view_04837.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04837.created_at_date: "7 days"]
    unless: [view_04837.id, view_04837.status]
  }

  join: view_04839 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04837.user_id} = ${view_04839.id} ;;
    required_joins: []
  }

  join: view_04840 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04837.account_id} = ${view_04840.account_id} ;;
    required_joins: [view_04839]
  }

  join: view_04841 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04837.category} = ${view_04841.category} ;;
  }

  access_filter: {
    field: view_04837.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04837.is_deleted} = false ;;
}
