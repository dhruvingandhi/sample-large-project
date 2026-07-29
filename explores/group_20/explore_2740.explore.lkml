# Explore: explore_2740
# Auto-generated LookML Explore File

include: "/views/domain_21/view_08221.view.lkml"
include: "/views/domain_23/view_08223.view.lkml"
include: "/views/domain_24/view_08224.view.lkml"
include: "/views/domain_25/view_08225.view.lkml"

explore: explore_2740 {
  label: "Explore Explore 2740"
  description: "Comprehensive analytics explore joining base view_08221 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08221
  
  always_filter: {
    filters: [view_08221.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08221.created_at_date: "7 days"]
    unless: [view_08221.id, view_08221.status]
  }

  join: view_08223 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08221.user_id} = ${view_08223.id} ;;
    required_joins: []
  }

  join: view_08224 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08221.account_id} = ${view_08224.account_id} ;;
    required_joins: [view_08223]
  }

  join: view_08225 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08221.category} = ${view_08225.category} ;;
  }

  access_filter: {
    field: view_08221.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08221.is_deleted} = false ;;
}
