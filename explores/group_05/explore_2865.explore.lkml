# Explore: explore_2865
# Auto-generated LookML Explore File

include: "/views/domain_46/view_08596.view.lkml"
include: "/views/domain_48/view_08598.view.lkml"
include: "/views/domain_49/view_08599.view.lkml"
include: "/views/domain_50/view_08600.view.lkml"

explore: explore_2865 {
  label: "Explore Explore 2865"
  description: "Comprehensive analytics explore joining base view_08596 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08596
  
  always_filter: {
    filters: [view_08596.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08596.created_at_date: "7 days"]
    unless: [view_08596.id, view_08596.status]
  }

  join: view_08598 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08596.user_id} = ${view_08598.id} ;;
    required_joins: []
  }

  join: view_08599 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08596.account_id} = ${view_08599.account_id} ;;
    required_joins: [view_08598]
  }

  join: view_08600 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08596.category} = ${view_08600.category} ;;
  }

  access_filter: {
    field: view_08596.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08596.is_deleted} = false ;;
}
