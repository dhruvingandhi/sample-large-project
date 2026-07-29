# Explore: explore_1162
# Auto-generated LookML Explore File

include: "/views/domain_37/view_03487.view.lkml"
include: "/views/domain_39/view_03489.view.lkml"
include: "/views/domain_40/view_03490.view.lkml"
include: "/views/domain_41/view_03491.view.lkml"

explore: explore_1162 {
  label: "Explore Explore 1162"
  description: "Comprehensive analytics explore joining base view_03487 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03487
  
  always_filter: {
    filters: [view_03487.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03487.created_at_date: "7 days"]
    unless: [view_03487.id, view_03487.status]
  }

  join: view_03489 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03487.user_id} = ${view_03489.id} ;;
    required_joins: []
  }

  join: view_03490 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03487.account_id} = ${view_03490.account_id} ;;
    required_joins: [view_03489]
  }

  join: view_03491 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03487.category} = ${view_03491.category} ;;
  }

  access_filter: {
    field: view_03487.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03487.is_deleted} = false ;;
}
