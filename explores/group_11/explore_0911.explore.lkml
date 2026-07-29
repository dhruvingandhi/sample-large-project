# Explore: explore_0911
# Auto-generated LookML Explore File

include: "/views/domain_34/view_02734.view.lkml"
include: "/views/domain_36/view_02736.view.lkml"
include: "/views/domain_37/view_02737.view.lkml"
include: "/views/domain_38/view_02738.view.lkml"

explore: explore_0911 {
  label: "Explore Explore 0911"
  description: "Comprehensive analytics explore joining base view_02734 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02734
  
  always_filter: {
    filters: [view_02734.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02734.created_at_date: "7 days"]
    unless: [view_02734.id, view_02734.status]
  }

  join: view_02736 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02734.user_id} = ${view_02736.id} ;;
    required_joins: []
  }

  join: view_02737 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02734.account_id} = ${view_02737.account_id} ;;
    required_joins: [view_02736]
  }

  join: view_02738 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02734.category} = ${view_02738.category} ;;
  }

  access_filter: {
    field: view_02734.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02734.is_deleted} = false ;;
}
