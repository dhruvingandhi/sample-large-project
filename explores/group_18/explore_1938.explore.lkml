# Explore: explore_1938
# Auto-generated LookML Explore File

include: "/views/domain_15/view_05815.view.lkml"
include: "/views/domain_17/view_05817.view.lkml"
include: "/views/domain_18/view_05818.view.lkml"
include: "/views/domain_19/view_05819.view.lkml"

explore: explore_1938 {
  label: "Explore Explore 1938"
  description: "Comprehensive analytics explore joining base view_05815 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05815
  
  always_filter: {
    filters: [view_05815.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05815.created_at_date: "7 days"]
    unless: [view_05815.id, view_05815.status]
  }

  join: view_05817 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05815.user_id} = ${view_05817.id} ;;
    required_joins: []
  }

  join: view_05818 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05815.account_id} = ${view_05818.account_id} ;;
    required_joins: [view_05817]
  }

  join: view_05819 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05815.category} = ${view_05819.category} ;;
  }

  access_filter: {
    field: view_05815.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05815.is_deleted} = false ;;
}
