# Explore: explore_3347
# Auto-generated LookML Explore File

include: "/views/domain_42/view_10042.view.lkml"
include: "/views/domain_44/view_10044.view.lkml"
include: "/views/domain_45/view_10045.view.lkml"
include: "/views/domain_46/view_10046.view.lkml"

explore: explore_3347 {
  label: "Explore Explore 3347"
  description: "Comprehensive analytics explore joining base view_10042 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10042
  
  always_filter: {
    filters: [view_10042.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10042.created_at_date: "7 days"]
    unless: [view_10042.id, view_10042.status]
  }

  join: view_10044 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10042.user_id} = ${view_10044.id} ;;
    required_joins: []
  }

  join: view_10045 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10042.account_id} = ${view_10045.account_id} ;;
    required_joins: [view_10044]
  }

  join: view_10046 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10042.category} = ${view_10046.category} ;;
  }

  access_filter: {
    field: view_10042.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10042.is_deleted} = false ;;
}
