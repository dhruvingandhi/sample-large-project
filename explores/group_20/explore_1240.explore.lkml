# Update for 2000 file diff target
# Explore: explore_1240
# Auto-generated LookML Explore File

include: "/views/domain_21/view_03721.view.lkml"
include: "/views/domain_23/view_03723.view.lkml"
include: "/views/domain_24/view_03724.view.lkml"
include: "/views/domain_25/view_03725.view.lkml"

explore: explore_1240 {
  label: "Explore Explore 1240"
  description: "Comprehensive analytics explore joining base view_03721 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03721
  
  always_filter: {
    filters: [view_03721.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03721.created_at_date: "7 days"]
    unless: [view_03721.id, view_03721.status]
  }

  join: view_03723 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03721.user_id} = ${view_03723.id} ;;
    required_joins: []
  }

  join: view_03724 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03721.account_id} = ${view_03724.account_id} ;;
    required_joins: [view_03723]
  }

  join: view_03725 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03721.category} = ${view_03725.category} ;;
  }

  access_filter: {
    field: view_03721.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03721.is_deleted} = false ;;
}
