# Explore: explore_3604
# Auto-generated LookML Explore File

include: "/views/domain_13/view_10813.view.lkml"
include: "/views/domain_15/view_10815.view.lkml"
include: "/views/domain_16/view_10816.view.lkml"
include: "/views/domain_17/view_10817.view.lkml"

explore: explore_3604 {
  label: "Explore Explore 3604"
  description: "Comprehensive analytics explore joining base view_10813 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10813
  
  always_filter: {
    filters: [view_10813.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10813.created_at_date: "7 days"]
    unless: [view_10813.id, view_10813.status]
  }

  join: view_10815 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10813.user_id} = ${view_10815.id} ;;
    required_joins: []
  }

  join: view_10816 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10813.account_id} = ${view_10816.account_id} ;;
    required_joins: [view_10815]
  }

  join: view_10817 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10813.category} = ${view_10817.category} ;;
  }

  access_filter: {
    field: view_10813.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10813.is_deleted} = false ;;
}
