# Explore: explore_3614
# Auto-generated LookML Explore File

include: "/views/domain_43/view_10843.view.lkml"
include: "/views/domain_45/view_10845.view.lkml"
include: "/views/domain_46/view_10846.view.lkml"
include: "/views/domain_47/view_10847.view.lkml"

explore: explore_3614 {
  label: "Explore Explore 3614"
  description: "Comprehensive analytics explore joining base view_10843 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10843
  
  always_filter: {
    filters: [view_10843.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10843.created_at_date: "7 days"]
    unless: [view_10843.id, view_10843.status]
  }

  join: view_10845 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10843.user_id} = ${view_10845.id} ;;
    required_joins: []
  }

  join: view_10846 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10843.account_id} = ${view_10846.account_id} ;;
    required_joins: [view_10845]
  }

  join: view_10847 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10843.category} = ${view_10847.category} ;;
  }

  access_filter: {
    field: view_10843.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10843.is_deleted} = false ;;
}
