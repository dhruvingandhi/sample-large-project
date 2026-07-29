# Explore: explore_3354
# Auto-generated LookML Explore File

include: "/views/domain_13/view_10063.view.lkml"
include: "/views/domain_15/view_10065.view.lkml"
include: "/views/domain_16/view_10066.view.lkml"
include: "/views/domain_17/view_10067.view.lkml"

explore: explore_3354 {
  label: "Explore Explore 3354"
  description: "Comprehensive analytics explore joining base view_10063 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10063
  
  always_filter: {
    filters: [view_10063.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10063.created_at_date: "7 days"]
    unless: [view_10063.id, view_10063.status]
  }

  join: view_10065 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10063.user_id} = ${view_10065.id} ;;
    required_joins: []
  }

  join: view_10066 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10063.account_id} = ${view_10066.account_id} ;;
    required_joins: [view_10065]
  }

  join: view_10067 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10063.category} = ${view_10067.category} ;;
  }

  access_filter: {
    field: view_10063.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10063.is_deleted} = false ;;
}
