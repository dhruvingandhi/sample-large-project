# Explore: explore_0412
# Auto-generated LookML Explore File

include: "/views/domain_37/view_01237.view.lkml"
include: "/views/domain_39/view_01239.view.lkml"
include: "/views/domain_40/view_01240.view.lkml"
include: "/views/domain_41/view_01241.view.lkml"

explore: explore_0412 {
  label: "Explore Explore 0412"
  description: "Comprehensive analytics explore joining base view_01237 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01237
  
  always_filter: {
    filters: [view_01237.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01237.created_at_date: "7 days"]
    unless: [view_01237.id, view_01237.status]
  }

  join: view_01239 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01237.user_id} = ${view_01239.id} ;;
    required_joins: []
  }

  join: view_01240 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01237.account_id} = ${view_01240.account_id} ;;
    required_joins: [view_01239]
  }

  join: view_01241 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01237.category} = ${view_01241.category} ;;
  }

  access_filter: {
    field: view_01237.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01237.is_deleted} = false ;;
}
