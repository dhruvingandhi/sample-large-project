# Explore: explore_2915
# Auto-generated LookML Explore File

include: "/views/domain_46/view_08746.view.lkml"
include: "/views/domain_48/view_08748.view.lkml"
include: "/views/domain_49/view_08749.view.lkml"
include: "/views/domain_50/view_08750.view.lkml"

explore: explore_2915 {
  label: "Explore Explore 2915"
  description: "Comprehensive analytics explore joining base view_08746 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08746
  
  always_filter: {
    filters: [view_08746.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08746.created_at_date: "7 days"]
    unless: [view_08746.id, view_08746.status]
  }

  join: view_08748 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08746.user_id} = ${view_08748.id} ;;
    required_joins: []
  }

  join: view_08749 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08746.account_id} = ${view_08749.account_id} ;;
    required_joins: [view_08748]
  }

  join: view_08750 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08746.category} = ${view_08750.category} ;;
  }

  access_filter: {
    field: view_08746.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08746.is_deleted} = false ;;
}
