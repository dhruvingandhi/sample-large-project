# Explore: explore_1347
# Auto-generated LookML Explore File

include: "/views/domain_42/view_04042.view.lkml"
include: "/views/domain_44/view_04044.view.lkml"
include: "/views/domain_45/view_04045.view.lkml"
include: "/views/domain_46/view_04046.view.lkml"

explore: explore_1347 {
  label: "Explore Explore 1347"
  description: "Comprehensive analytics explore joining base view_04042 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04042
  
  always_filter: {
    filters: [view_04042.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04042.created_at_date: "7 days"]
    unless: [view_04042.id, view_04042.status]
  }

  join: view_04044 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04042.user_id} = ${view_04044.id} ;;
    required_joins: []
  }

  join: view_04045 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04042.account_id} = ${view_04045.account_id} ;;
    required_joins: [view_04044]
  }

  join: view_04046 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04042.category} = ${view_04046.category} ;;
  }

  access_filter: {
    field: view_04042.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04042.is_deleted} = false ;;
}
