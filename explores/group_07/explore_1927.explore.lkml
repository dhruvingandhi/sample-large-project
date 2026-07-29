# Explore: explore_1927
# Auto-generated LookML Explore File

include: "/views/domain_32/view_05782.view.lkml"
include: "/views/domain_34/view_05784.view.lkml"
include: "/views/domain_35/view_05785.view.lkml"
include: "/views/domain_36/view_05786.view.lkml"

explore: explore_1927 {
  label: "Explore Explore 1927"
  description: "Comprehensive analytics explore joining base view_05782 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05782
  
  always_filter: {
    filters: [view_05782.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05782.created_at_date: "7 days"]
    unless: [view_05782.id, view_05782.status]
  }

  join: view_05784 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05782.user_id} = ${view_05784.id} ;;
    required_joins: []
  }

  join: view_05785 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05782.account_id} = ${view_05785.account_id} ;;
    required_joins: [view_05784]
  }

  join: view_05786 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05782.category} = ${view_05786.category} ;;
  }

  access_filter: {
    field: view_05782.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05782.is_deleted} = false ;;
}
