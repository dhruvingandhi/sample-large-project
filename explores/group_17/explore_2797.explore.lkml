# Update for 2000 file diff target
# Explore: explore_2797
# Auto-generated LookML Explore File

include: "/views/domain_42/view_08392.view.lkml"
include: "/views/domain_44/view_08394.view.lkml"
include: "/views/domain_45/view_08395.view.lkml"
include: "/views/domain_46/view_08396.view.lkml"

explore: explore_2797 {
  label: "Explore Explore 2797"
  description: "Comprehensive analytics explore joining base view_08392 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08392
  
  always_filter: {
    filters: [view_08392.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08392.created_at_date: "7 days"]
    unless: [view_08392.id, view_08392.status]
  }

  join: view_08394 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08392.user_id} = ${view_08394.id} ;;
    required_joins: []
  }

  join: view_08395 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08392.account_id} = ${view_08395.account_id} ;;
    required_joins: [view_08394]
  }

  join: view_08396 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08392.category} = ${view_08396.category} ;;
  }

  access_filter: {
    field: view_08392.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08392.is_deleted} = false ;;
}
