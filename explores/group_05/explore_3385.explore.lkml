# Explore: explore_3385
# Auto-generated LookML Explore File

include: "/views/domain_06/view_10156.view.lkml"
include: "/views/domain_08/view_10158.view.lkml"
include: "/views/domain_09/view_10159.view.lkml"
include: "/views/domain_10/view_10160.view.lkml"

explore: explore_3385 {
  label: "Explore Explore 3385"
  description: "Comprehensive analytics explore joining base view_10156 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10156
  
  always_filter: {
    filters: [view_10156.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10156.created_at_date: "7 days"]
    unless: [view_10156.id, view_10156.status]
  }

  join: view_10158 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10156.user_id} = ${view_10158.id} ;;
    required_joins: []
  }

  join: view_10159 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10156.account_id} = ${view_10159.account_id} ;;
    required_joins: [view_10158]
  }

  join: view_10160 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10156.category} = ${view_10160.category} ;;
  }

  access_filter: {
    field: view_10156.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10156.is_deleted} = false ;;
}
