# Explore: explore_2073
# Auto-generated LookML Explore File

include: "/views/domain_20/view_06220.view.lkml"
include: "/views/domain_22/view_06222.view.lkml"
include: "/views/domain_23/view_06223.view.lkml"
include: "/views/domain_24/view_06224.view.lkml"

explore: explore_2073 {
  label: "Explore Explore 2073"
  description: "Comprehensive analytics explore joining base view_06220 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06220
  
  always_filter: {
    filters: [view_06220.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06220.created_at_date: "7 days"]
    unless: [view_06220.id, view_06220.status]
  }

  join: view_06222 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06220.user_id} = ${view_06222.id} ;;
    required_joins: []
  }

  join: view_06223 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06220.account_id} = ${view_06223.account_id} ;;
    required_joins: [view_06222]
  }

  join: view_06224 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06220.category} = ${view_06224.category} ;;
  }

  access_filter: {
    field: view_06220.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06220.is_deleted} = false ;;
}
