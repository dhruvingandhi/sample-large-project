# Explore: explore_3762
# Auto-generated LookML Explore File

include: "/views/domain_37/view_11287.view.lkml"
include: "/views/domain_39/view_11289.view.lkml"
include: "/views/domain_40/view_11290.view.lkml"
include: "/views/domain_41/view_11291.view.lkml"

explore: explore_3762 {
  label: "Explore Explore 3762"
  description: "Comprehensive analytics explore joining base view_11287 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11287
  
  always_filter: {
    filters: [view_11287.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11287.created_at_date: "7 days"]
    unless: [view_11287.id, view_11287.status]
  }

  join: view_11289 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11287.user_id} = ${view_11289.id} ;;
    required_joins: []
  }

  join: view_11290 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11287.account_id} = ${view_11290.account_id} ;;
    required_joins: [view_11289]
  }

  join: view_11291 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11287.category} = ${view_11291.category} ;;
  }

  access_filter: {
    field: view_11287.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11287.is_deleted} = false ;;
}
